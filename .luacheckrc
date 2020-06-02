-- -*- mode: lua; -*- vim: ft=lua tw=80

-- Rerun tests only if their modification time changed.
cache = true

ignore = {
  "212", -- Unused argument, _arg_name is easier to understand than _, so this option is set to off.
}

globals = {
}
