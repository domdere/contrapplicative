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
    ,   (<||>)
    ) where

import Preamble

class (Applicative f') => Contrapplicative f f' b | f -> f', f -> b where
    decontra :: f a -> f' (a -> b)

(<||>) :: (Contrapplicative c f r) => ((a -> r) -> b) -> c a -> f b
f <||> cx = f <$> decontra cx
