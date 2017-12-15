<?php

namespace App\Http\Middleware;

use App\Http\Controllers\Base;
use Closure;

class AuthHeader
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */

    public function handle($request, Closure $next)
    {
        $role = Base::role();

        if ($role == Base::guest()) {
            Base::app_unauthorized();
        }



        $nonJsonRoutes = array(
            'api/upload',
        );

        if ($request->isMethod('POST') || $request->isMethod('PUT')) {

            if (in_array($request->route()->uri, $nonJsonRoutes)) {

            } else {

                $info = json_decode($request->getContent());

                if (json_last_error() != JSON_ERROR_NONE) {

                    return Base::touser("Json not Valid", false);

                }

                if (!array_key_exists('data', $info)) {
                    return Base::touser("Json data attribute null", false);
                }
                if (count($info) <= 0) {
                    return Base::touser("Json data attribute empty", false);
                }

            }

        }


// print_r(timezone_abbreviations_list());

//         if(Base::timezone() == 1)
//         {

// print_r(timezone_name_from_abbr('IST'));



// print_r(timezone_identifiers_list());

//             //print_r(Base::timezone_check(Base::timezone_header()));
// die();

//             // if (Base::timezone_check(Base::timezone_header())){


//             // }
//         }




        return $next($request);
    }
}
