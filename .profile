export GOPATH=$HOME/repo/gocode
export PATH=$HOME/.lyftkube-bin:/usr/local/opt/node@10/bin:/usr/local/opt/mysql-client/bin:$HOME/bin:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.lyftkube-bin:$PATH

source '/Users/rmcgowan/work/awsaccess/awsaccess2.sh' # awsaccess
source '/Users/rmcgowan/work/awsaccess/oktaawsaccess.sh' # oktaawsaccess
export PS1="\$(ps1_mfa_context)$PS1" # awsaccess

# Add support for Go modules and Lyft's Athens module proxy/store
# These variables were added by 'hacktools/set_go_env_vars.sh'
export GOPROXY='https://athens.ingress.infra.us-east-1.k8s.lyft.net'
export GONOSUMDB='github.com/lyft/*,github.lyft.net/*'
export GO111MODULE='on'
export CGO_CPPFLAGS="-Wno-error -Wno-nullability-completeness -Wno-expansion-to-defined -Wno-builtin-requires-header"
