class GerritPage < Page
  attr_accessor :changes

  def initialize
    super('gerrit', 45.seconds)
  end

  def process!
    @changes = Gerrit.get_pending_changes
  end

end