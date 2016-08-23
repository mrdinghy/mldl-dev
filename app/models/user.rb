class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #extend EnumerateIt
  #has_enumeration_for :role

  #belongs_to :person




  has_many :userroles, :dependent => :destroy
  has_many :roles, :through => :userroles
  has_many :structures, :through => :userroles


  has_many :issueactions, :dependent => :destroy
  has_many :issues, :through => :issueactions

  def namesake
    namesake = self.name
    return namesake
  end

end
