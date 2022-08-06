class FlashComponent < ViewComponent::Base
  def initialize(type:, message:)
    @type = type
    @message = message
  end

  def color_classes
    {
      alert: alert_classes,
      notice: notice_classes,
    }.fetch(type.to_sym)
  end

  def icon_path
    {
      alert: 'icons/exclamation-solid.svg',
      notice: 'icons/checkmark-circle-solid.svg',
    }.fetch(type.to_sym)
  end

  def title
    {
      alert: 'Error',
      notice: 'Success',
    }.fetch(type.to_sym)
  end

  private

  attr_reader :type, :message

  def alert_classes
    {
      button: 'bg-red-300 text-red-500 hover:bg-red-400 focus:ring-offset-red-50 focus:ring-red-600',
      bg: 'bg-red-300',
      icon: 'text-red-700',
    }
  end

  def notice_classes
    {
      button: 'bg-green-200 text-green-500 hover:bg-green-300 focus:ring-offset-green-50 focus:ring-green-600',
      bg: 'bg-green-200',
      icon: 'text-green-700',
    }
  end
end
