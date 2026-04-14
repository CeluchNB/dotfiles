# Install Homebrew
if ! command -v brew &>/dev/null then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages
brew bundle --file=Brewfile

# Install AWS CLI
if ! command -v aws &>/dev/null then
  echo "Installing AWS CLI..."
  curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
  sudo installer -pkg AWSCLIV2.pkg -target /
fi

# Install Claude Code
if ! command -v claude &>/dev/null then
  echo "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi

