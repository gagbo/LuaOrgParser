local lpeg = require("lpeg");
-- local locale = lpeg.locale();

local P = lpeg.P;

-- local S, V = lpeg.S, lpeg.V;

-- local C, Cb, Cc, Cg, Cs, Cmt =
--   lpeg.C, lpeg.Cb, lpeg.Cc, lpeg.Cg, lpeg.Cs, lpeg.Cmt;

-- local function K (k) -- keyword
--   return P(k) * -(locale.alnum + P "_");
-- end

local heading = P("*")^1;

local orgGrammar = P{
  "Document";
  Document = heading
} * -1

return {
  orgGrammar = orgGrammar
}
