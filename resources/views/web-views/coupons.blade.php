<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Table Page</title>

    <!-- Add the provided CSS here -->
    <style>
        .table-responsive {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }

        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
            background-color: #f8f9fa;
        }

        .table tbody + tbody {
            border-top: 2px solid #dee2e6;
        }

        .table .thead-light th {
            background-color: #f8f9fa;
        }

        .table-hover tbody tr:hover {
            background-color: #f2f5f8;
        }

        .text-capitalize {
            text-transform: capitalize;
        }

        .table td span {
            display: block;
        }

        .d-flex {
            display: flex;
        }

        .flex-wrap {
            flex-wrap: wrap;
        }

        .gap-1 {
            gap: 0.25rem;
        }

        .switcher {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 20px;
        }

        .switcher_input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .switcher_control {
            position: absolute;
            top: 0;
            left: 0;
            width: 20px;
            height: 20px;
            background-color: #ccc;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }

        .switcher_input:checked + .switcher_control {
            background-color: #28a745;
        }
    </style>
</head>

<body>

    <!-- Your existing HTML table code goes here -->
    <div class="table-responsive">
        <table id="datatable"
            class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table {{ Session::get('direction') === 'rtl' ? 'text-right' : 'text-left' }}">
            <thead class="thead-light thead-50 text-capitalize">
                <tr>
                    <th>{{\App\CPU\translate('coupon')}}</th>
                    <th>{{\App\CPU\translate('coupon_type')}}</th>
                    <th>Terms & Conditions</th>
                    <th>{{\App\CPU\translate('Duration')}}</th>
                    <th>{{\App\CPU\translate('user_limit')}}</th>
                    <th>{{\App\CPU\translate('Discount')}}</th>
                    <th>{{\App\CPU\translate('discount_type')}}</th>
                    <th>{{\App\CPU\translate('minimum_purchase')}}</th>
                    <th>{{\App\CPU\translate('maximum_discount')}}</th>
                    <th>{{\App\CPU\translate('Status')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($c as $c)
                <tr>

                    <td>
                        <div>{{substr($c['title'],0,20)}}</div>
                        <strong>code: {{$c['code']}}</strong>
                    </td>
                    <td class="text-capitalize">{{str_replace('_',' ',$c['coupon_type'])}}</td>
                    <td>{{$c['terms']}}</td>
                    <td>
                        <div class="d-flex flex-wrap gap-1">
                            <span>{{date('d M, y',strtotime($c['start_date']))}} - </span>
                            <span>{{date('d M, y',strtotime($c['expire_date']))}}</span>
                        </div>
                    </td>
                    <td>
                        <span>{{\App\CPU\translate('Limit')}}: <strong>{{ $c['limit'] }},</strong></span>
                        <span class="ml-1">{{\App\CPU\translate('Used')}}: <strong>{{ $c['order_count'] }}</strong></span>
                    </td>
                    <td>{{$c['discount_type']=='amount'?\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($c['discount'])):$c['discount']}}</td>
                    <td><span class="text-capitalize">{{$c['discount_type']}}</span></td>
                    <td>{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($c['min_purchase']))}}</td>
                    <td>{{\App\CPU\BackEndHelper::set_symbol(\App\CPU\BackEndHelper::usd_to_currency($c['max_discount']))}}</td>
                    <td>
                        <label class="switcher">
                            <input type="checkbox" class="switcher_input"
                                onclick="location.href='{{route('admin.coupon.status',[$c['id'],$c->status?0:1])}}'"
                                class="toggle-switch-input" {{$c->status?'checked':''}}>
                            <span class="switcher_control"></span>
                        </label>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

</body>

</html>
