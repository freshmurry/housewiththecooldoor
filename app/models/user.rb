# class User < ApplicationRecord
  
#   devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :trackable, :validatable
  
#   has_many :pins, dependent: :destroy
#   has_many :comments, dependent: :destroy
       
#   validates :name, presence: true, length: {maximum: 50}

#   #validates :password, :presence => true,
#   				        		# :on => :create,
#   				        		# :format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/ }
# end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy

  validates :name, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end