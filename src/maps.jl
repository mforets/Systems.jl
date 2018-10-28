"""
    LinearMap

A linear map
```math
x \mapsto Ax
```

### Fields

- `A` -- matrix
"""
struct LinearMap{MT<:AbstractMatrix} <: AbstractMap
    A::MT
end

"""
    AffineMap

An affine map
```math
x \mapsto Ax + b
```

### Fields

- `A` -- matrix
- `b` -- vector
"""
struct AffineMap{MT<:AbstractMatrix, VT<:AbstractVector} <: AbstractMap
    A::MT
    b::VT
end

"""
    LinearControlMap

An affine map
```math
x \mapsto Ax + Bu, u ∈ \\mathcal{U}.
```

### Fields

- `A` -- matrix
- `B` -- matrix
- `U` -- input constraints
"""
struct LinearControlMap{MT<:AbstractMatrix, UT} <: AbstractMap
    A::MT
    B::MT
    U::UT
end

"""
    AffineMap

An affine map
```math
x \mapsto Ax + Bu + c, u ∈ \\mathcal{U}.
```

### Fields

- `A` -- matrix
- `B` -- matrix
- `c` -- vector
- `U` -- input constraints
"""
struct AffineControlMap{MT<:AbstractMatrix, VT<:AbstractVector, UT} <: AbstractMap
    A::MT
    B::MT
    c::VT
    U::UT
end

"""
    SystemWithOutput

Parametric composite type for systems with outputs. It is parameterized in the
system's type and in the map's type.

### Fields

- `system`    -- system
- `outputmap` -- output map
"""
struct SystemWithOutput{ST<:AbstractSystem, MT<:AbstractMap}
    system::ST
    outputmap::MT
end
