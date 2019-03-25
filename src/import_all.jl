##### Beginning of file

function _predictmdfull_import_all(env::AbstractDict = ENV)::Bool
    raw_env_value = strip(
        lowercase(
            strip(
                get(env, "PREDICTMDFULL_IMPORT_ALL", "")
                )
            )
        )
    return length(raw_env_value) == 0 || raw_env_value == "true"
end

_import_all_on_init() = _import_all_on_init(Main)

function _import_all_on_init(m::Module)::Nothing
    if _predictmdfull_import_all()
        import_all(m)
    end
end

import_all() = import_all(Main)

function import_all(m::Module)::Nothing
    package_list::Vector{String} = sort(unique(strip.(_package_list())))
    stdlib_list::Vector{String} = sort(unique(strip.(_stdlib_list())))
    for s in stdlib_list
        Base.eval(
            m,
            Base.Meta.parse(
                string(
                    "try ",
                    "import $(string(s)); ",
                    "@info(\"imported $(string(s))\"); ",
                    "catch e1 @warn(\"ignoring exception: \", e1,); ",
                    "end ",
                    ),
                ),
            )
    end
    for p in package_list
        Base.eval(
            m,
            Base.Meta.parse(
                string(
                    "try ",
                    "import $(string(p)); ",
                    "catch e2 ",
                    "@info(\"ignoring exception: \", e2,); ",
                    "try ",
                    "import Pkg; ",
                    "Pkg.add(\"$(string(p))\"); ",
                    "catch e3 ",
                    "@info(\"ignoring exception: \", e3,); ",
                    "end ",
                    "end ",
                    ),
                ),
            )
        Base.eval(
            m,
            Base.Meta.parse(
                string(
                    "try ",
                    "import $(string(p)); ",
                    "@info(\"imported $(string(p))\"); ",
                    "catch e4 ",
                    "@warn(\"ignoring exception: \", e4,); ",
                    "end ",
                    ),
                ),
            )
    end
end

##### End of file
