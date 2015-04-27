# Contrapplicative

A form of Applicative for Contravariant Functors

## Movitation

### Applicative

Briefly, applicative functors are are great for composing into products, let me just briefly explain what I mean.

A general way of representing a product of 2 types `a` and `b` is as a function `f :: a -> b -> c`.

Which can be lifted into a function that can represent a product of the two types `f a` and `f b` with `liftA2`:

``` Haskell
liftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c
```

#### Currying

Even better, currying can be used to create an intermediate result when taking products:

```
>>> :t (,)
(,) :: a -> b -> (a, b)
>>> :t (,) 1
(,) 1 :: Num a => b -> (a, b)
>>> :t (,) 1 2
(,) 1 2 :: (Num b, Num a) => (a, b)
>>> (,) 1 2
(1,2)
```

With the aid of the `<$>` and `<*>` operators from `Data.Functor` and `Control.Applicative` respectively, this effect can be extended to the lifted functions:

```
>>> :t (,)
(,) :: a -> b -> (a, b)
>>> :t ((,) <$>)
((,) <$>) :: Functor f => f a -> f (b -> (a, b))
>>> :t ((,) <$> (Just 1))
((,) <$> (Just 1)) :: Num a => Maybe (b -> (a, b))
>>> :t ((,) <$> (Just 1) <*>)
((,) <$> (Just 1) <*>) :: Num a1 => Maybe a -> Maybe (a1, a)
>>> :t ((,) <$> (Just 1) <*> Just 2)
((,) <$> (Just 1) <*> Just 2) :: (Num a1, Num a) => Maybe (a1, a)
>>> ((,) <$> (Just 1) <*> Just 2)
Just (1,2)
>>> ((,) <$> (Just 1) <*> Nothing)
Nothing
```

This allows us to handle products of any number of types!

### What about sum types?

So if we have a value of type `f' a` that can somehow result in producing 0 or more values of type `a` (or not in the case of the `Const` functor), and similarly a value of type `f' b` that can produce 0 or more values of type `b`, and a function of type `a -> b -> c`, we can use `Applicative` to generate a value of type `f' c` that can produce 0 or more values of type `c`.

So what if we have a value of type `f a` that *consumes* a value of type `a`, and a value of type `f b` that consumes a value of type `b` and a fold function `(a -> r) -> (b -> r) -> c -> r`, how do I get a value of type `f c`, that *consumes* a value of type `c`?

Let's also say that `f` is an instance of [`Contravariant`] [contravariant-typeclass]

Most people will recognise the function specified above as the type of `either :: (a -> c) -> (b -> c) -> Either a b -> c`.

In the `contravariant` package there is a type class [`Decidable`] [contravariant]:

``` Haskell
-- I'm skipping over Divisible for now.
class (Divisible f) => Decidable f where
    lose :: (a -> Void) -> f a
    choose :: (a -> Either b c) -> f b -> f c -> f a
```

So, **two** types at a time, we can provide something that consumes a value of type `b`, and one that consumes a value of type `c`, and function `a -> Either b c` that dispatches a value of type `a` to either a value of type `b` or `c`, and we'll get something that consumes a value of type `a`.

This is great for two types, but for more than two types, we'll have to concoct contrived set of functions `a -> Either b c` to sequentially combine them all.

## Contrapplicative

TODO.

## Building the project

    make build

## Running Unit Tests

    make test

[contravariant-typeclass]: https://hackage.haskell.org/package/contravariant-1.3.1/docs/Data-Functor-Contravariant.html#t:Contravariant "Contravariant Typeclass"
