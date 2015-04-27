-------------------------------------------------------------------
-- |
-- Module       : Data.Functor.Contravariant.Contra
-- Copyright    : (C) 2014-2015 Dom De Re
-- License      : BSD3
-- Maintainer   : Dom De Re
--
-------------------------------------------------------------------
module Data.Functor.Contravariant.Contra (
    -- * Types
        Contra
    -- * Functions
    ,   mkContra
    ,   runContra
    ) where

import Data.Functor.Contravariant ( Contravariant(..) )

import Preamble

newtype Contra r a = Contra { unContra :: a -> r }

instance Contravariant (Contra r) where
--  contramap :: (a -> b) -> f b ->  f a
    contramap f (Contra g) = Contra $ g . f

runContra :: Contra r a -> a -> r
runContra = unContra

mkContra :: (a -> r) -> Contra r a
mkContra = Contra
