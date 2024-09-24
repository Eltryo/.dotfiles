local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls_dir = home .. "/.local/share/nvim/mason/packages/jdtls"
local path_to_lombok = jdtls_dir .. "/lombok.jar"
local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. path_to_lombok,
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
    '-configuration', jdtls_dir .. '/config_linux',
    '-data', workspace_folder,
  },
  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"});
  settings = {
    java = {
    }
  },

  init_options = {
    bundles = {}
  },
}

require('jdtls').start_or_attach(config)
