function ap_extend_ending()

    local endpoint_underground = EntityGetWithTag( "ending_sampo_spot_underground" )
    local endpoint_mountain = EntityGetWithTag( "ending_sampo_spot_mountain" )
    local orb_count = GameGetOrbCountThisRun()

    local entity_id = GetUpdatedEntityID()
    local ap_x, ap_y = EntityGetTransform(entity_id)

--    if(doing_newgame_plus == false) then
--        print(tostring(endpoint_underground))
--        if(orb_count >= 33) then
--                --33 orb ending
--                GameAddFlagRun("ap_peaceful_ending")
--            if (orb_count > 33) then
--                --34 orb ending
--                GameAddFlagRun("ap_yendor_ending")
--            end
--
--            local distance_from_mountain = 1000
--
--            if(#endpoint_mountain > 0) then
--                local ex, ey = EntityGetTransform(endpoint_mountain[1])
--                distance_from_mountain = math.abs(ap_x - ex) + math.abs(ap_y-ey)
--            end
--
--            if(distance_from_mountain < 32) then
--                --peaceful ending
--                GameAddFlagRun("ap_peaceful_ending")
--            end
--        end
    if ( #endpoint_underground > 0 ) then
        local endpoint_id = endpoint_underground[1]
	local ex, ey = EntityGetTransform( endpoint_id )
	local distance = math.abs(ap_x - ex) + math.abs(ap_y - ey)
		
	if (distance < 32) then
            --normal ending
            GameAddFlagRun("ap_greed_ending")
        end

    elseif ( #endpoint_mountain > 0 ) then
        local endpoint_id = endpoint_mountain[1]
	local ex, ey = EntityGetTransform( endpoint_id )
		
	local distance = math.abs(ap_x - ex) + math.abs(ap_y - ey)
		
	if (distance < 32) then
	    if (orb_count >= 34) then
	        -- yendor ending
		GameAddFlagRun("ap_yendor_ending")
	    end
	    if (orb_count >= 33) then
	        -- peaceful ending
		GameAddFlagRun("ap_peaceful_ending")
	    end
	    if (orb_count == 11) then
	        -- pure ending
		GameAddFlagRun("ap_pure_ending")
	    elseif (orb_count < 33) then
                --toxic ending or ng+
                print("why would you do this, it isn't even one of the goals")
	    end
        end
    end
end

ap_extend_ending()
