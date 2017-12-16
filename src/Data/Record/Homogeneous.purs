module Data.Record.Homogeneous
  ( has
  , get
  ) where

import Data.Function.Uncurried (Fn4, runFn4)
import Data.Maybe (Maybe(..))
import Data.Record.Unsafe (unsafeHas)
import Type.Row.Homogeneous (class Homogeneous)

foreign import getFn
  :: forall r t
   . Homogeneous r t
  => Fn4 (t -> Maybe t) (Maybe t) String (Record r) (Maybe t)

has :: forall r t . Homogeneous r t => String -> Record r -> Boolean
has = unsafeHas

get :: forall r t. Homogeneous r t => String -> Record r -> Maybe t
get = runFn4 getFn Just Nothing
