{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances #-}
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
    ,   idContra
    ,   mkContra
    ,   runContra
    ) where

import Control.Applicative.Contravariant

import Data.Functor.Contravariant ( Contravariant(..) )
import Data.Functor.Identity ( Identity(..) )

import Preamble

newtype Contra r a = Contra { unContra :: a -> r }

instance Contravariant (Contra r) where
--  contramap :: (a -> b) -> f b -> f a
    contramap f (Contra g) = Contra $ g . f

instance Contrapplicative (Contra r) Identity r where
--  contra :: f' (a -> b) -> f a
    contra (Identity f) = Contra f

--  decontra :: f a -> f' (a -> b)
    decontra (Contra f) = Identity f

runContra :: Contra r a -> a -> r
runContra = unContra

mkContra :: (a -> r) -> Contra r a
mkContra = Contra

idContra :: Contra r r
idContra = Contra id
