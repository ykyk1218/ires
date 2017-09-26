require 'rbconfig'
require 'ires/util'

desc "Build shared objects"
task :build do
  os = Ires::Util.current_os
  return if os.nil?
  exec "CGO_ENABLED=1 GOOS=\"#{os}\" go build -v -buildmode=c-shared -o shared/\"#{os}\"/ires.so ext/main.go"
end