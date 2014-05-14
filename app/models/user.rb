class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin user banned]         
  has_many :participations
  has_many :events, through: :participations 
  before_create :set_default_role
  belongs_to :role


 private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
end
