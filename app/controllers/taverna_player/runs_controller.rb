#------------------------------------------------------------------------------
# Copyright (c) 2013 The University of Manchester, UK.
#
# BSD Licenced. See LICENCE.rdoc for details.
#
# Taverna Player was developed in the BioVeL project, funded by the European
# Commission 7th Framework Programme (FP7), through grant agreement
# number 283359.
#
# Author: Robert Haines
#------------------------------------------------------------------------------

class TavernaPlayer::RunsController < ApplicationController
  # Do not remove the next line.
  include TavernaPlayer::Concerns::Controllers::RunsController

  # Extend the RunsController here.

  before_action :authorize_owner, :only => [:edit, :update, :destroy, :read_interaction, :write_interaction]

  alias_method :old_run_params, :run_params

  def run_params
    p = old_run_params
    p = p.merge(:user_id => current_user.id) if user_signed_in?
    p
  end

  def find_runs
    select = { :embedded => false }
    select[:workflow_id] = params[:workflow_id] if params[:workflow_id]
    @runs = TavernaPlayer::Run.where(select).order("created_at DESC").page(params[:page])
  end

  # Only allow the workflow owner (or an admin) to modify or delete the run
  def authorize_owner
    authorize(can?(action_name, @run))
  end
end
