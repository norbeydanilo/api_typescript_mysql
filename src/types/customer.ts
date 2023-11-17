export interface BasicCustomer {
  id: number,
}

export interface Customer extends BasicCustomer {
  name: string,
  email?: string, // ? propiedad es opcional. El objeto puede tener o no esta propiedad
  password?: string
}