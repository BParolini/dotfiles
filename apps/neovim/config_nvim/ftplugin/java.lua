local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_linux"
local plugins_dir = jdtls_dir .. "/plugins/"
local path_to_jar = plugins_dir .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "build.gradle.kts" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == "" then
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

os.execute("mkdir -p " .. workspace_dir)

-- Main Config
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdk.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",

        "-jar", path_to_jar,
        "-configuration", config_dir,
        "-data", workspace_dir,
    },

    root_dir = root_dir,

    settings = {
        java = {
            home = os.getenv("HOME") .. "/apps/jdk-17",
            eclipse = {
                downloadSources = true
            },
            configuration ={
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = os.getenv("HOME") .. "/apps/jdk-17",
                    },
                    --{
                    --    name = "JavaSE-20",
                    --    path = os.getenv("HOME") .. "/apps/jdk-20",
                    --},
                }
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            format = {
                enabled = true,
                settings = {
                    url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },

            signatureHelp = { enabled = true },

            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                importOrder = {
                    "java",
                    "javax",
                    "com",
                    "org",
                },
            },

            sources = {
                organizeImports = {
                    startThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },

            flags = {
                allow_incremental_sync = true,
            },
            init_options = {
                bundles = {},
            },
        }
    }
}

config["on_attach"] = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>oi", ':lua require("jdtls").organizeImports()<CR>', opts)
    vim.keymap.set("n", "<leader>jc", ':lua require("jdtls").compile("incremental")', opts)
end

require("jdtls").start_or_attach(config)
