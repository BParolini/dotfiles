source "$HOME/.secrets/personal/dev.sh"

# region olxbr mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$HOME/.secrets/meli/fury"

    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export CC="/opt/homebrew/opt/llvm/bin/clang"
    export CXX="/opt/homebrew/opt/llvm/bin/clang++"

    alias cc="$CC"
fi
# endregion

# Sets Java environment variables
if [[ -d "$SDKMAN_CANDIDATES_DIR/java/current" ]]; then
    export JAVA_HOME="$SDKMAN_CANDIDATES_DIR/java/current"
elif [[ -d "$HOME/apps/java" ]]; then
    export JAVA_HOME="$HOME/apps/java"
fi

# export JAVA_TOOL_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -Dsun.java2d.xrender=true"

if [[ -f "$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar" ]]; then
    export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
fi

export GRADLE_USER_HOME="$HOME/.gradle"

# Sets Python environment variables
export PIPENV_VENV_IN_PROJECT=1

# Sets NVM environment variables
export NVM_SYMLINK_CURRENT=true
export NVM_NODE_PATH="$HOME/.nvm/current"

# Sets Go environment variables
if [ -d "$HOME/apps/go" ]; then
    export GOROOT="$HOME/apps/go"
fi
export GOPATH="$HOME/projetos/go"
export GOBIN="$HOME/.local/bin"

# Sets Rust environment variables
export RUSTUP_HOME="$HOME/apps/rust"
export CARGO_HOME="$HOME/apps/cargo"
export CARGO_BIN_HOME="$CARGO_HOME/bin"

# Sets Kafka environment variables
if [ -d "$HOME/apps/kafka" ]; then
    export KAFKA_HOME="$HOME/apps/kafka"
fi

# Sets Kubernetes environment variables
export KUBE_EDITOR="nvim"

# Sets Docker / Podman environment variables
if [[ "$ID" = "fedora" ]]
then
    export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
fi

export PATH="$JAVA_HOME/bin:$GOROOT/bin:$GOBIN:$CARGO_BIN_HOME:$NVM_NODE_PATH/bin:$KAFKA_HOME/bin:$PATH"
