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

module TavernaPlayer
  class RunPort < ActiveRecord::Base
    # Do not remove the next line.
    include TavernaPlayer::Concerns::Models::RunPort

    # Extend the RunPort model here.
  end

  class RunPort::Input < RunPort
    # Do not remove the next line.
    include TavernaPlayer::Concerns::Models::Input

    # Extend the RunPort::Input model here.
  end

  class RunPort::Output < RunPort
    # Do not remove the next line.
    include TavernaPlayer::Concerns::Models::Output

    # Extend the RunPort::Output model here.
  end
end
