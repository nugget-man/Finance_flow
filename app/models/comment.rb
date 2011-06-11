class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  attr_accessible :id, :title, :comment, :commentable_id, :commentable_type
  belongs_to :commentable, :polymorphic => true
  belongs_to :customer

  default_scope :order => 'created_at ASC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
end
