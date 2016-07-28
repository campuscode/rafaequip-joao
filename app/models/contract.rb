class Contract < ApplicationRecord
  validates :number, :rented_equipment, :request_number, :customer, :address,
            :contact, :rental_period, :start_date, :end_date, presence: true
  validates :rented_equipment, presence:
      { message: 'É necessário selecionar
                                    ao menos um equipamento' }
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment
  has_one :receipt
  belongs_to :rental_period
  has_one :received_receipt

  before_save :set_price
  after_create :set_equipment_rented

  enum status: [:open, :closed]

  def equipment_list_names
    list = ''

    equipment.each do |eq|
      list << "#{eq.serial_number} / #{eq.name}, "
    end
    list
  end

  def period_format
    "#{I18n.l(start_date)} a #{I18n.l(end_date)}"
  end

  def amount_paid
    price - discount
  end

  def contract_status
    return 'Fechado' if closed?
    'Aberto'
  end

  private

  def set_price
    self.price = equipment.reduce(0) do |a, e|
      a + e.price_for(rental_period)
    end
  end

  def set_equipment_rented
    equipment.each(&:rented!)
  end
end
