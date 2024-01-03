/* ex_00 */
select * from customer;

/* ex_01 */
select FirstName || ' ' || LastName as CustomerName, CustomerId, Country
from customer
where Country != 'US';

/* ex_02 */
select FirstName || ' ' || LastName as CustomerName
from customer
where Country = 'Brazil';

/* ex_03 */
select customer.FirstName || ' ' || customer.LastName AS CustomerName,
       invoice.InvoiceId, invoice.InvoiceDate, invoice.billingCountry
from invoice
         join customer on invoice.CustomerID = customer.CustomerID
where customer.Country = 'Brazil';

/* ex_04 */
select FirstName || ' ' || LastName as EmployeeFullName
from employee
where Title = 'Sales Manager' or Title = 'Sales Support Agent';

/* ex_05 */
select BillingCountry
from invoice
where BillingCountry is not null
group by BillingCountry;

/* ex_06 */
select invoice.InvoiceId, employee.FirstName || ' ' || employee.LastName as EmployeeName
from employee join customer on employee.EmployeeId = customer.SupportRepId
              join invoice on customer.CustomerId = invoice.CustomerId
where employee.Title = 'Sales Manager' or employee.Title = 'Sales Support Agent';

/* ex_07 */
select invoice.total,
       customer.FirstName || ' ' || customer.LastName as CustomerName,
       invoice.BillingCountry,
       employee.FirstName || ' ' || employee.LastName as SalesAgentName
from invoice
         join customer on invoice.CustomerId = customer.CustomerId
         join employee on customer.SupportRepId = employee.EmployeeId
where Employee.Title = 'Sales Support Agent' or Employee.Title = 'Sales Manager';

/* ex_08 */
select strftime('%Y', InvoiceDate) as year, sum(Total) as TotalInvoiceForYear
from Invoice
where strftime('%Y', InvoiceDate) = '2009' or strftime('%Y', InvoiceDate) = '2011'
group by strftime('%Y', InvoiceDate);

/* ex_09 */
select sum(quantity) as SumOfQuantityID37 from InvoiceLine where InvoiceId = 37;

/* ex_10 */
select InvoiceId, sum(Quantity) as SumOfQuantity from InvoiceLine
group by InvoiceId;

/* ex_11 */
select InvoiceLine.InvoiceId, track.name
from InvoiceLine join track on track.trackId = InvoiceLine.trackId;

/* ex_12 */
select InvoiceLine.InvoiceLineId, Track.name as TrackName, artist.Name
from InvoiceLine join track on InvoiceLine.TrackId = track.TrackId
                 join album on track.AlbumId = album.AlbumId
                 join artist on album.ArtistId = artist.ArtistId;

/* ex_13 */
select sum(InvoiceLine.quantity) as SumOfQuantity, Invoice.billingCountry
from Invoice join InvoiceLine on Invoice.InvoiceId = InvoiceLine.InvoiceId
group by Invoice.billingCountry;

/* ex_14 */
select count(PlaylistTrack.trackId) as NumberOfTracks, Playlist.name as PlaylistName
from PlaylistTrack join playlist on playlist.playlistId = playlistTrack.playlistid
group by playlist.name;

/* ex_15 */
select track.name as TrackName, album.title as AlbumTitle, MediaType.Name as MediaTypeName, genre.name as Genre
from Track join album on Track.AlbumId = album.AlbumId
           join MediaType on Track.MediaTypeId = MediaType.MediaTypeId
           join genre on Track.GenreId = genre.GenreId;

/* ex_16 */
select invoiceId, count(quantity) as Quantity from InvoiceLine
group by InvoiceId;

/* ex_17 */
select sum(invoice.total) as TotalSales, Employee.firstName || ' ' || Employee.lastName as EmployeeName
from employee join customer on employee.EmployeeId = customer.SupportRepId
              join invoice on customer.CustomerId = invoice.CustomerId
group by EmployeeName;

/* ex_18 */
select sum(invoice.total) as InvoiceTotal, employee.firstName || ' ' || employee.lastName as EmployeeName
from employee join customer on employee.EmployeeId = customer.SupportRepId
              join invoice on customer.CustomerId = invoice.CustomerId
where strftime('%Y', InvoiceDate) = '2009'
group by EmployeeName
order by InvoiceTotal desc limit 1;

/* ex_19 */
select sum(invoice.total) as InvoiceTotal, employee.firstName || ' ' || employee.lastName as EmployeeName
from employee join customer on employee.EmployeeId = customer.SupportRepId
              join invoice on customer.CustomerId = invoice.CustomerId
where strftime('%Y', InvoiceDate) = '2010'
group by EmployeeName
order by InvoiceTotal desc limit 1;

/* ex_20 */
select sum(invoice.total) as InvoiceTotal, employee.firstName || ' ' || employee.lastName as EmployeeName
from employee join customer on employee.EmployeeId = customer.SupportRepId
              join invoice on customer.CustomerId = invoice.CustomerId
group by EmployeeName
order by InvoiceTotal desc limit 1;

/* ex_21 */
select count(Customer.customerId) as NumberOfCustomers,
       Employee.firstName || ' ' || Employee.lastName as EmployeeName
from Employee join customer on Employee.EmployeeId = customer.SupportRepId
where employee.Title = 'Sales Support Agent'
group by EmployeeName;

/* ex_22 */
select BillingCountry, sum(total) as InvoiceTotal from Invoice
group by BillingCountry
order by InvoiceTotal desc;

/* ex_23 */
select track.name as TrackName, sum(InvoiceLine.quantity) as Quantity
from invoice join InvoiceLine on invoice.InvoiceId = InvoiceLine.InvoiceId
             join track on InvoiceLine.TrackId = track.TrackId
where strftime('%Y', invoice.InvoiceDate) = '2013'
group by track.name
order by Quantity desc;

/* ex_24 */
select track.name as TrackName, sum(InvoiceLine.quantity) as Quantity
from invoice join InvoiceLine on invoice.InvoiceId = InvoiceLine.InvoiceId
             join track on InvoiceLine.TrackId = track.TrackId
where strftime('%Y', invoice.InvoiceDate) = '2013'
group by track.name
order by Quantity desc limit 5;