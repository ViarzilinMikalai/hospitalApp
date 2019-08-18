<#import "pager.ftl" as p>

<@p.pager url page/>


    <table class="table table-bordered table-sm">
        <thead class="thead-light">
        <tr>
            <th scope="col">Фамилия </th>
            <th scope="col">Имя</th>
            <th scope="col">Отчество</th>
            <th scope="col">Дата рождения</th>
            <th scope="col">Адрес</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody >

                <#list page.content as patient>
                <tr ${patient.deleted?then('class="table-danger"', '')}>
                    <td>${patient.lastname}</td>
                    <td>${patient.firstname}</td>
                    <td>${patient.surname}</td>
                    <td><#if patient.birthDate??>${patient.birthDate}</#if></td>
                    <td>
                        <#if patient.city??>${patient.city},</#if>
                        <#if patient.street??>${patient.street},</#if>
                        <#if patient.apartment??>${patient.apartment}</#if>
                        <#if patient.building??>${patient.building}</#if>
                    </td>

                    <td>
                        ${patient.deleted?then('<a href="/patients?reparePatient=${patient.id}">Repare</a>',
                        '<a href="/patients?removePatient=${patient.id}">Delete</a>')}
                    </td>
                    <td><a href="/patients?patient=${patient.id}">edit</a></td>
                </tr>
                </#list>
        </tbody>
    </table>
<@p.pager url page/>