-------------------------------------------------------------------
-- |
-- Module       : Preamble
-- Copyright    : (C) 2014-2015 Dom De Re
-- License      : BSD3
-- Maintainer   : Dom De Re
--
-- The bits of the Prelude used in this project.
--
-------------------------------------------------------------------
module Preamble (
    -- * Type Classes
        Functor(..)
    ,   Foldable(..)
    ,   Traversable(..)
    ,   Applicative(..)
    ,   Monad(..)
    ,   Show(..)
    ,   Eq(..)
    ,   Num(..)
    ,   Ord(..)
    -- * Types
    ,   Bool(..)
    ,   Char
    ,   Double
    ,   Either(..)
    ,   Int
    ,   IO
    ,   Maybe
    ,   String
    ,   Word16
    -- * Operators
    ,   (.)
    ,   ($)
    ,   (<$>)
    ,   (++)
    ,   (&&)
    ,   (||)
    -- * Functions
    ,   id
    ,   const
    ,   either
    ,   flip
    ,   fromIntegral
    ,   maybe
    ,   otherwise
    ,   ord
    ) where

import Prelude
import Control.Applicative
import Data.Char ( ord )
import Data.Foldable ( Foldable(..) )
import Data.Traversable ( Traversable(..) )
import Data.Word ( Word16 )
