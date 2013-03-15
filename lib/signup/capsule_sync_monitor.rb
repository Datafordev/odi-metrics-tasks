class CapsuleSyncMonitor
  @queue = :signup
  
  # This monitors capsuleCRM for changes and queues up individual changes for update in the frontend app
  def self.perform
    orgs = CapsuleCRM::Organisation.find_all(:tag => "Membership")
    orgs.each do |org|
      # Check if data tags have been updated
      if org.updated_at > 2.hours.ago && org.tags.find {|t| t.name == "Membership"}
        Resque.enqueue(SyncCapsuleData, org.id)
      end
    end
  end
  
end