class DashboardTime
  @queue = :metrics
  
  def self.perform
    Resqueue.enqueue LeftronicPublisher, :html, ENV['LEFTRONIC_JENKINS_TIME'], "<div>#{Time.now.to_s}</div>"
  end

end