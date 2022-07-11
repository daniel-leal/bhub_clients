defmodule BhubClients.Util.Normalization do
  @doc ~S"""
  Remove all chars except words

  ## Examples

    iex> BhubClients.Util.Normalization.remove_special_chars("67-013.000")
    "67013000"

    iex> BhubClients.Util.Normalization.remove_special_chars("012.234.567-00")
    "01223456700"

    iex> BhubClients.Util.Normalization.remove_special_chars("abc 0123")
    "abc0123"

    iex> BhubClients.Util.Normalization.remove_special_chars("56.641.759/0001-08")
    "56641759000108"
  """
  def remove_special_chars(value) do
    String.replace(value, ~r/\W/u, "")
  end
end
