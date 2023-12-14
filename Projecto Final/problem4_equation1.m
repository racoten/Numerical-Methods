function f = problem4_equation1(z, H)
    f = 200 * (z ./ (5 + z)) .* exp(-2 * z ./ H);
end

