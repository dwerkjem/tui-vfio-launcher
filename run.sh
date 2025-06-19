#!/usr/bin/env bash
set -Eeuo pipefail

# ─── Prevent direct root invocation ───
# Only allow root if INVOKED_AS_ROOT is set (from our internal sudo exec).
if [[ "$EUID" -eq 0 && -z "${INVOKED_AS_ROOT:-}" ]]; then
  echo "❌ Please run this script as a regular user. It will escalate privileges when needed."
  exit 1
fi

# ─── Project roots & files ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REQ="$SCRIPT_DIR/requirements.txt"
VENV="$SCRIPT_DIR/venv"

if [[ ! -f "$REQ" ]]; then
  echo "❌ requirements.txt not found in $SCRIPT_DIR"
  exit 1
fi

# ─── Ensure Python 3 ───
if ! command -v python3 &>/dev/null; then
  echo "❌ Python3 is required."
  exit 1
fi

# ─── Create & activate venv ───
echo "📦 Setting up virtual environment…"
if [[ ! -d "$VENV" ]]; then
  python3 -m venv "$VENV"
  echo "✅ Created venv at $VENV"
fi
# shellcheck source=/dev/null
source "$VENV/bin/activate"

# ─── We need the venv module ───
if ! python3 -c 'import venv' &>/dev/null; then
  echo "📦 Installing python3-venv…"
  sudo apt update
  sudo apt install -y python3-venv
fi

# ─── Install Python deps ───
echo "🔄 Installing Python dependencies…"
python3 -m pip install --upgrade pip
python3 -m pip install -r "$REQ"
echo "✅ Python packages installed in venv."

# ─── Now escalate only for system tasks ───
if [[ "$EUID" -ne 0 ]]; then
  echo "⚠️  Switching to root for system configuration…"
  # Pass our internal flag so the re-invoked script knows it’s authorized as root.
  exec sudo INVOKED_AS_ROOT=1 bash "$0" "$@"
fi
