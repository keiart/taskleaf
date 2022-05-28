class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    #エラー発生
    # Sidekiq::Logging.logger.info "サンプルジョブを実行しました"
  end
end
