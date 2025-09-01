---@diagnostic disable: undefined-global

return {
	s({ trig = "if" },
		fmta([[
        if (<>) {
            <>;
        }
        ]],
			{
				i(1),
				i(2),
			})
	),
}

