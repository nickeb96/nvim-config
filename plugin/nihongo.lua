
local symbol_map = {
  [" "] = "　",
  [","] = "、",
  ["."] = "。",
  ["<"] = "＜",
  [">"] = "＞",
  ["'"] = "＇",
  ['"'] = "＂",
  [";"] = "；",
  [":"] = "：",
  ["/"] = "・",
  ["?"] = "？",
  ["!"] = "！",
  ["@"] = "＠",
  ["#"] = "＃",
  ["$"] = "＄",
  ["%"] = "％",
  ["^"] = "＾",
  ["&"] = "＆",
  ["*"] = "＊",
  ["("] = "（",
  [")"] = "）",
  ["["] = "「",
  ["]"] = "」",
  ["{"] = "『",
  ["}"] = "』",
  ["`"] = "｀",
  ["~"] = "〜",
  ["="] = "＝",
  ["+"] = "＋",
  ["-"] = "ー",
  ["_"] = "＿",
}

local digit_map = {
  ["1"] = "１",
  ["2"] = "２",
  ["3"] = "３",
  ["4"] = "４",
  ["5"] = "５",
  ["6"] = "６",
  ["7"] = "７",
  ["8"] = "８",
  ["9"] = "９",
  ["0"] = "０",
}

local hirigana_map = {
  ["a"] = "あ",
  ["i"] = "い",
  ["u"] = "う",
  ["e"] = "え",
  ["o"] = "お",

  ["ka"] = "か",
  ["ki"] = "き",
  ["ku"] = "く",
  ["ke"] = "け",
  ["ko"] = "こ",
  ["ga"] = "が",
  ["gi"] = "ぎ",
  ["gu"] = "ぐ",
  ["ge"] = "げ",
  ["go"] = "ご",

  ["sa"] = "さ",
  ["si"] = "し",
  ["shi"] = "し",
  ["su"] = "す",
  ["se"] = "せ",
  ["so"] = "そ",
  ["za"] = "ざ",
  ["zi"] = "じ",
  ["ji"] = "じ",
  ["zu"] = "ず",
  ["ze"] = "ぜ",
  ["zo"] = "ぞ",

  ["ta"] = "た",
  ["ti"] = "ち",
  ["chi"] = "ち",
  ["tu"] = "つ",
  ["tsu"] = "つ",
  ["te"] = "て",
  ["to"] = "と",
  ["da"] = "だ",
  ["di"] = "ぢ",
  ["du"] = "づ",
  ["dzu"] = "づ",
  ["de"] = "で",
  ["do"] = "ど",

  ["na"] = "な",
  ["ni"] = "に",
  ["nu"] = "ぬ",
  ["ne"] = "ね",
  ["no"] = "の",

  ["ha"] = "は",
  ["hi"] = "ひ",
  ["hu"] = "ふ",
  ["fu"] = "ふ",
  ["he"] = "へ",
  ["ho"] = "ほ",
  ["ba"] = "ば",
  ["bi"] = "び",
  ["bu"] = "ぶ",
  ["be"] = "べ",
  ["bo"] = "ぼ",
  ["pa"] = "ぱ",
  ["pi"] = "ぴ",
  ["pu"] = "ぷ",
  ["pe"] = "ぺ",
  ["po"] = "ぽ",

  ["ma"] = "ま",
  ["mi"] = "み",
  ["mu"] = "む",
  ["me"] = "め",
  ["mo"] = "も",

  ["ya"] = "や",
  ["yu"] = "ゆ",
  ["yo"] = "よ",

  ["ra"] = "ら",
  ["ri"] = "り",
  ["ru"] = "る",
  ["re"] = "れ",
  ["ro"] = "ろ",

  ["wa"] = "わ",
  ["wo"] = "を",
  ["nn"] = "ん",

  ["lya"] = "ゃ",
  ["lyu"] = "ゅ",
  ["lyo"] = "ょ",
  ["ltu"] = "っ",
  ["ltsu"] = "っ",

  ["kya"] = "きゃ",
  ["kyu"] = "きゅ",
  ["kyo"] = "きょ",
  ["gya"] = "ぎゃ",
  ["gyu"] = "ぎゅ",
  ["gyo"] = "ぎょ",

  ["sya"] = "しゃ",
  ["syu"] = "しゅ",
  ["syo"] = "しょ",
  ["sha"] = "しゃ",
  ["shu"] = "しゅ",
  ["sho"] = "しょ",
  ["shya"] = "しゃ",
  ["shyu"] = "しゅ",
  ["shyo"] = "しょ",
  ["zya"] = "じゃ",
  ["zyu"] = "じゅ",
  ["zyo"] = "じょ",
  ["jya"] = "じゃ",
  ["jyu"] = "じゅ",
  ["jyo"] = "じょ",
  ["ja"] = "じゃ",
  ["ju"] = "じゅ",
  ["jo"] = "じょ",

  ["tya"] = "ちゃ",
  ["tyu"] = "ちゅ",
  ["tyo"] = "ちょ",
  ["cha"] = "ちゃ",
  ["chu"] = "ちゅ",
  ["cho"] = "ちょ",
  ["chya"] = "ちゃ",
  ["chyu"] = "ちゅ",
  ["chyo"] = "ちょ",
  ["dya"] = "ぢゃ",
  ["dyu"] = "ぢゅ",
  ["dyo"] = "ぢょ",

  ["nya"] = "にゃ",
  ["nyu"] = "にゅ",
  ["nyo"] = "にょ",

  ["hya"] = "ひゃ",
  ["hyu"] = "ひゅ",
  ["hyo"] = "ひょ",
  ["bya"] = "びゃ",
  ["byu"] = "びゅ",
  ["byo"] = "びょ",
  ["pya"] = "ぴゃ",
  ["pyu"] = "ぴゅ",
  ["pyo"] = "ぴょ",

  ["mya"] = "みゃ",
  ["myu"] = "みゅ",
  ["myo"] = "みょ",

  ["rya"] = "りゃ",
  ["ryu"] = "りゅ",
  ["ryo"] = "りょ",
}

local katakana_map = {
  ["A"] = "ア",
  ["I"] = "イ",
  ["U"] = "ウ",
  ["E"] = "エ",
  ["O"] = "オ",

  ["KA"] = "カ",
  ["KI"] = "キ",
  ["KU"] = "ク",
  ["KE"] = "ケ",
  ["KO"] = "コ",
  ["GA"] = "ガ",
  ["GI"] = "ギ",
  ["GU"] = "グ",
  ["GE"] = "ゲ",
  ["GO"] = "ゴ",

  ["SA"] = "サ",
  ["SI"] = "シ",
  ["SHI"] = "シ",
  ["SU"] = "ス",
  ["SE"] = "セ",
  ["SO"] = "ソ",
  ["ZA"] = "ザ",
  ["ZI"] = "ジ",
  ["JI"] = "ジ",
  ["ZU"] = "ズ",
  ["ZE"] = "ゼ",
  ["ZO"] = "ゾ",

  ["TA"] = "タ",
  ["TI"] = "チ",
  ["CHI"] = "チ",
  ["TU"] = "ツ",
  ["TSU"] = "ツ",
  ["TE"] = "テ",
  ["TO"] = "ト",
  ["DA"] = "ダ",
  ["DI"] = "ヂ",
  ["DU"] = "ヅ",
  ["DZU"] = "ヅ",
  ["DE"] = "デ",
  ["DO"] = "ド",

  ["NA"] = "ナ",
  ["NI"] = "ニ",
  ["NU"] = "ヌ",
  ["NE"] = "ネ",
  ["NO"] = "ノ",

  ["HA"] = "ハ",
  ["HI"] = "ヒ",
  ["HU"] = "フ",
  ["FU"] = "フ",
  ["HE"] = "ヘ",
  ["HO"] = "ホ",
  ["BA"] = "バ",
  ["BI"] = "ビ",
  ["BU"] = "ブ",
  ["BE"] = "ベ",
  ["BO"] = "ボ",
  ["PA"] = "パ",
  ["PI"] = "ピ",
  ["PU"] = "プ",
  ["PE"] = "ペ",
  ["PO"] = "ポ",

  ["MA"] = "マ",
  ["MI"] = "ミ",
  ["MU"] = "ム",
  ["ME"] = "メ",
  ["MO"] = "モ",

  ["YA"] = "ヤ",
  ["YU"] = "ユ",
  ["YO"] = "ヨ",

  ["RA"] = "ラ",
  ["RI"] = "リ",
  ["RU"] = "ル",
  ["RE"] = "レ",
  ["RO"] = "ロ",

  ["WA"] = "ワ",
  ["WO"] = "ヲ",
  ["NN"] = "ン",

  ["LYA"] = "ャ",
  ["LYU"] = "ュ",
  ["LYO"] = "ョ",
  ["LTU"] = "ッ",
  ["LTSU"] = "ッ",

  ["KYA"] = "キャ",
  ["KYU"] = "キュ",
  ["KYO"] = "キョ",
  ["GYA"] = "ギャ",
  ["GYU"] = "ギュ",
  ["GYO"] = "ギョ",

  ["SYA"] = "シャ",
  ["SYU"] = "シュ",
  ["SYO"] = "ショ",
  ["SHA"] = "シャ",
  ["SHU"] = "シュ",
  ["SHO"] = "ショ",
  ["SHYA"] = "シャ",
  ["SHYU"] = "シュ",
  ["SHYO"] = "ショ",
  ["ZYA"] = "ジャ",
  ["ZYU"] = "ジュ",
  ["ZYO"] = "ジョ",
  ["JYA"] = "ジャ",
  ["JYU"] = "ジュ",
  ["JYO"] = "ジョ",
  ["JA"] = "ジャ",
  ["JU"] = "ジュ",
  ["JO"] = "ジョ",

  ["TYA"] = "チャ",
  ["TYU"] = "チュ",
  ["TYO"] = "チョ",
  ["CHA"] = "チャ",
  ["CHU"] = "チュ",
  ["CHO"] = "チョ",
  ["CHYA"] = "チャ",
  ["CHYU"] = "チュ",
  ["CHYO"] = "チョ",
  ["DYA"] = "ヂャ",
  ["DYU"] = "ヂュ",
  ["DYO"] = "ヂョ",

  ["NYA"] = "ニャ",
  ["NYU"] = "ニュ",
  ["NYO"] = "ニョ",

  ["HYA"] = "ヒャ",
  ["HYU"] = "ヒュ",
  ["HYO"] = "ヒョ",
  ["BYA"] = "ビャ",
  ["BYU"] = "ビュ",
  ["BYO"] = "ビョ",
  ["PYA"] = "ピャ",
  ["PYU"] = "ピュ",
  ["PYO"] = "ピョ",

  ["MYA"] = "ミャ",
  ["MYU"] = "ミュ",
  ["MYO"] = "ミョ",

  ["RYA"] = "リャ",
  ["RYU"] = "リュ",
  ["RYO"] = "リョ",
}

local romaji_map = {
  ["a"] = "ａ",
  ["b"] = "ｂ",
  ["c"] = "ｃ",
  ["d"] = "ｄ",
  ["e"] = "ｅ",
  ["f"] = "ｆ",
  ["g"] = "ｇ",
  ["h"] = "ｈ",
  ["i"] = "ｉ",
  ["j"] = "ｊ",
  ["k"] = "ｋ",
  ["l"] = "ｌ",
  ["m"] = "ｍ",
  ["n"] = "ｎ",
  ["o"] = "ｏ",
  ["p"] = "ｐ",
  ["q"] = "ｑ",
  ["r"] = "ｒ",
  ["s"] = "ｓ",
  ["t"] = "ｔ",
  ["u"] = "ｕ",
  ["v"] = "ｖ",
  ["w"] = "ｗ",
  ["x"] = "ｘ",
  ["y"] = "ｙ",
  ["z"] = "ｚ",

  ["A"] = "Ａ",
  ["B"] = "Ｂ",
  ["C"] = "Ｃ",
  ["D"] = "Ｄ",
  ["E"] = "Ｅ",
  ["F"] = "Ｆ",
  ["G"] = "Ｇ",
  ["H"] = "Ｈ",
  ["I"] = "Ｉ",
  ["J"] = "Ｊ",
  ["K"] = "Ｋ",
  ["L"] = "Ｌ",
  ["M"] = "Ｍ",
  ["N"] = "Ｎ",
  ["O"] = "Ｏ",
  ["P"] = "Ｐ",
  ["Q"] = "Ｑ",
  ["R"] = "Ｒ",
  ["S"] = "Ｓ",
  ["T"] = "Ｔ",
  ["U"] = "Ｕ",
  ["V"] = "Ｖ",
  ["W"] = "Ｗ",
  ["X"] = "Ｘ",
  ["Y"] = "Ｙ",
  ["Z"] = "Ｚ",
}

local function create_mapping_set(mappings)
  for _, map in ipairs(mappings) do
    for k, v in pairs(map) do
      vim.keymap.set("i", k, v, { buffer = true })
    end
  end
end

local function delete_mapping_set(mappings)
  for _, map in ipairs(mappings) do
    for k, _ in pairs(map) do
      local result, success = pcall(vim.keymap.del, "i", k, { buffer = true })
      if not success then
        vim.print(success, result, k)
      end
    end
  end
end

local function create_romaji_bindings()
  if vim.b.nihongo == "hirigana" then
    delete_mapping_set({hirigana_map, katakana_map})
    create_mapping_set({romaji_map})
    vim.b.nihongo = "romaji"
  elseif vim.b.nihongo == "romaji" then
    delete_mapping_set({romaji_map})
    create_mapping_set({hirigana_map, katakana_map})
  end
end

local function create_bindings()
  create_mapping_set({hirigana_map, katakana_map, digit_map, symbol_map})
  vim.keymap.set("i", "<C-l>", create_romaji_bindings, { buffer = true })
  vim.b.nihongo = "hirigana"
  vim.b.nihongo_save_tm = vim.o.timeoutlen
  vim.o.timeoutlen = 3000
end

local function delete_bindings()
  delete_mapping_set({digit_map, symbol_map})
  vim.keymap.del("i", "<C-l>", { buffer = true })
  if vim.b.nihongo == "hirigana" then
    delete_mapping_set({hirigana_map, katakana_map})
  elseif vim.b.nihongo == "romaji" then
    delete_mapping_set({romaji_map})
  end
  vim.b.nihongo = nil
  vim.o.timeoutlen = vim.b.nihongo_save_tm
end

local function toggle_bindings()
  if not vim.b.nihongo then
    create_bindings()
  else
    delete_bindings()
  end
end

vim.api.nvim_create_user_command("J", toggle_bindings, {})

vim.keymap.set("i", "<C-j>", toggle_bindings)

