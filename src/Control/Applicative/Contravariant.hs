{-# LANGUAGE FunctionalDependencies, MultiParamTypeClasses #-}
-------------------------------------------------------------------
-- |
-- Module       : Control.Applicative.Contravariant
-- Copyright    : (C) 2014-2015 Dom De Re
-- License      : BSD3
-- Maintainer   : Dom De Re
--
-------------------------------------------------------------------
module Control.Applicative.Contravariant (
    -- * Type Classes
        Contrapplicative(..)
    -- * Operators
    ,   (<<>)
    ,   (<>>)
    ) where

import Data.Functor.Contravariant ( Contravariant(..) )

import Preamble

class (Contravariant f, Applicative f') => Contrapplicative f f' b | f -> f', f -> b where
    contra :: f' (a -> b) -> f a
    decontra :: f a -> f' (a -> b)

(<<>) :: (Contrapplicative c f r) => ((a -> r) -> b) -> c a -> f b
f <<> cx = f <$> decontra cx

(<>>) :: (Contrapplicative c f r) => f ((a -> r) -> b -> r) -> c a -> c b
fx <>> cx = contra $ fx <*> decontra cx
