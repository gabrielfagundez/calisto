class GerritPage < Page
  attr_accessor :changes

  def initialize(time)
    super('gerrit', time)
  end

  def process!
    @changes = Gerrit.get_pending_changes
  end

end