lua<<EOF
package.loaded["config"] = nil
local config = require "config"
config()
EOF