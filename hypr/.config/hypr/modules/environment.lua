-- hl.env("XCURSOR_SIZE", "24")
-- hl.env("HYPRCURSOR_SIZE", "24")
-- hl.env("XCURSOR_THEME", "Adwaita")
-- hl.env(
-- 	"XCURSOR_PATH",
-- 	os.getenv("HOME") .. "/.local/share/icons:" .. os.getenv("HOME") .. "/.icons:/run/current-system/sw/share/icons"
-- )

hl.env("HYPRCURSOR_THEME", "macOS-hypr")
hl.env("HYPRCURSOR_SIZE", "28")

-- fallback for GTK / XWayland / apps that don't use server-side cursors
hl.env("XCURSOR_THEME", "macOS")
hl.env("XCURSOR_SIZE", "28")
