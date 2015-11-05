module CandidatesHelper
  def present_transcript
    candidate = Candidate.includes(:campaign).find(params[:id])
    @transcripts = candidate.statements.approved.select{|st| st.transcript.present?}
    return @transcripts
  end
end
