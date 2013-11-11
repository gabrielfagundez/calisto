class Gerrit
  SERVER = 'http://intranet.moove-it.com:8081'
  USERNAME = 'virginia.rodriguez'
  PASSWORD = 'eHsy6cKk+hYD'

  def self.get_pending_changes
    changes = gerrit_client.changes([URI.encode('q=status:open+project:^numerex.*+reviewer:"Jenkins-CI"&o=LABELS')])
    relevant_changes = []

    changes.each do |change|
      if change_approved_by_jenkins?(change) && !change_code_reviewed?(change)
        relevant_changes <<
            {
              description: change['subject'],
              project: change['project'],
              owner:  change['owner']['name'],
              last_updated: change['updated'].to_time
            }
      end
    end

    relevant_changes.sort!{ |a,b| a[:last_updated] <=> b[:last_updated] }
  end

  def self.gerrit_client
    @client ||= Gerry.new(SERVER, USERNAME, PASSWORD)
  end

  private

  def self.change_approved_by_jenkins?(change)
    change['labels']['Verified'].has_key?('approved')
  end

  def self.change_code_reviewed?(change)
    change['labels']['Code-Review'].any?
  end

end