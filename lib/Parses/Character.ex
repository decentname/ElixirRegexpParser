defmodule RegexpParser.Character do
  @moduledoc "Parse a literal character."

  use Combine
  use Combine.Helpers
  import RegexpParser.Quantifier

  @enforce_keys [:char]
  defstruct [:char, :quantifier]

  def parser_character() do
    map(
      sequence([
        char(),
        parser_quantifier()
      ]),
      fn
        [c, q] -> %RegexpParser.Character{char: c, quantifier: q}
        [c] -> %RegexpParser.Character{char: c}
      end
    )
  end

end
