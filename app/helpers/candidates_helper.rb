module CandidatesHelper
  def present_transcript
    @transcripts = Statement.approved.select{|st| st.transcript.present?}
  end
end
