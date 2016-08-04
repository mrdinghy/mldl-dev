class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #extend EnumerateIt
  #has_enumeration_for :role

  #belongs_to :person


  has_many :assignments, :dependent => :destroy
  has_many :structures, :through => :assignments


  has_many :userroles, :dependent => :destroy
  has_many :roles, :through => :userroles



end
