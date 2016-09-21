class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #extend EnumerateIt
  #has_enumeration_for :role

  #belongs_to :person

  #ROLES = %i[admin structure_admin structure_manager]


  has_many :userroles, :dependent => :destroy
  has_many :roles, :through => :userroles

  has_many :issueactions, :dependent => :destroy
  has_many :issues, :through => :issueactions

  def namesake
    namesake = self.name
    return namesake
  end

  def mystructure(structure_id)
    sids = Manage.select(:structure_id).where('user_id = ?', self.id)
    sids_array = sids.collect{|s| s.structure_id}
    if sids.include?(structure_id)
    return true
    else
      return false
    end

  end



  #def roles=(roles)
    #roles = [*roles].map { |r| r.to_sym }
    #self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  #end

  #def roles
    #ROLES.reject do |r|
      #((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    #end
  #end











end
