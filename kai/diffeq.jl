using DifferentialEquations
using GLMakie

function lorenz!(du, u, p, t)
    du[1] = 10.0 * (u[2] - u[1])
    du[2] = u[1] * (28.0 - u[3]) - u[2]
    du[3] = u[1] * u[2] - (8 / 3) * u[3]
end

function pt!(dα, α, p, t) # mappings for p: 1-N, 2-J, 3-U, 4-p, 5-δ, 6-κ
    N = Int(p[1])
    dα[1] = -(p[6]/2+im*p[5])*α[1]-im*p[2]*α[2]-2*im*p[3]*α[1]*conj(α[1])*α[1]-im*p[4]
    for i in 2:N-1
        dα[i] = im*(p[5]*α[1]-p[2]*α[i+1]-p[2]*α[i-1]-2*p[3]*α[i]*conj(α[i])*α[i])
    end
    dα[N] = -(p[6]/2+im*p[5])*α[N]-im*p[2]*α[N-1]-2*im*p[3]*α[N]*conj(α[N])*α[N]
end


set_theme!(theme_black())
fig = Figure()
#ax = Axis3(fig[1, 1], protrusions = (0, 0, 0, 0),
#        viewmode = :fit, limits = (-30, 30, -30, 30, 0, 50))
ax = Axis(fig[1, 1])

slider = Slider(fig[1, 2], range = 0:1:10, horizontal = false, startvalue = 3)

N=3

sol = lift(slider.value) do x
    α0 = fill(1.0im, N)
    tspan = (0.0, 100.0)
    p = [N, 1.0, 1.0, 10.0, 0.0, 1.0]
    prob = ODEProblem(pt!, α0, tspan, p);

    #u0 = [1.0; 0.0; x];
    #tspan = (0.0, 10.0)
    #prob = ODEProblem(lorenz!, u0, tspan)
    
    s=solve(prob, RK4(), dt=0.001)
    #sol=[s.t, abs.(s[1,:])]
    #lines!(s.t, abs.(s[Int(x),:]), transparency = true)
end

s=sol.val
for i in 1:size(s.u[1])[1]
    lines!(s.t, abs.(s[i,:]), transparency = true)
end

fig
