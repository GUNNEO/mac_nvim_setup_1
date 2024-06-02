-- import comment plugin safely
-- gcc to comment code
-- gc(number)j to comment multiple codes
local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- enable comment
comment.setup()
