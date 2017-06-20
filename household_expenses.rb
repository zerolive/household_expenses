class HouseholdExpenses
  def call(env)
    [200, {}, [readme_to_s]]
  end

  private

  def readme_to_s
    file = File.open("README.md", "rb")
    file.read
  end
end
