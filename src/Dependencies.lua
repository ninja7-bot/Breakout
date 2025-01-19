-- LIBRARIES
Class = require 'lib/class'
push = require 'lib/push'


-- CONSTANTS
require 'src/Constants'


-- Class Blocks
require 'src/Ball'
require 'src/Paddle'
require 'src/Brick'

require 'src/LevelMaker'


-- STATE MACHINE
require 'src/StateMachine'

-- UTIL
require 'src/Util'


-- States
require 'src/states/BaseState'
require 'src/states/PlayState'
require 'src/states/GameOverState'
require 'src/states/ServeState'
require 'src/states/VictoryState'
require 'src/states/HighScoreState'
require 'src/states/EnterHighScoreState'
require 'src/states/PaddleSelectState'
require 'src/states/StartState'