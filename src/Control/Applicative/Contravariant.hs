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
    ) where

import Preamble

class (Applicative f') => Contrapplicative f f' b | f -> f', f -> b where
    (<^>) :: f a -> f' (a -> b)
